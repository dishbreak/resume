package main

import (
	"html/template"
	"os"

	"gopkg.in/yaml.v2"
)

type Resume struct {
	Name                string `yaml:"name"`
	Objective           string `yaml:"objective"`
	ProfessionalSummary string `yaml:"summary"`
	ContactInfo         struct {
		Email       string `yaml:"email"`
		GithubUrl   string `yaml:"github_url"`
		PhoneNumber string `yaml:"phone"`
		Website     string `yaml:"website"`
	} `yaml:"contact"`
	Skills struct {
		Languages  []string `yaml:"languages"`
		Additional []string `yaml:"additional"`
	} `yaml:"skills"`
	KeyAchievements []string `yaml:"key_achievements"`
	Education       []struct {
		Start      string `yaml:"start"`
		End        string `yaml:"end"`
		SchoolName string `yaml:"name"`
		Degree     string `yaml:"degree"`
	} `yaml:"education"`
	ProfessionalExperience []struct {
		Employer  string `yaml:"employer"`
		Start     string `yaml:"start"`
		End       string `yaml:"end"`
		Truncated bool   `yaml:"truncate"`
		Positions []struct {
			Title        string   `yaml:"title"`
			Start        string   `yaml:"start"`
			End          string   `yaml:"end"`
			Summary      []string `yaml:"summary"`
			Technologies []string `yaml:"technologies"`
		} `yaml:"positions"`
	} `yaml:"experience"`
}

func main() {
	f, err := os.Open("resume.yaml")
	if err != nil {
		panic(err)
	}
	defer f.Close()

	var r Resume
	decoder := yaml.NewDecoder(f)
	decoder.Decode(&r)

	tpl, err := template.ParseFiles("resume.tpl")
	if err != nil {
		panic(err)
	}

	outFile, err := os.Create("index.html")
	if err != nil {
		panic(err)
	}
	defer outFile.Close()

	tpl.Execute(outFile, r)
}

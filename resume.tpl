<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>

<div class="container">
    <div class="row">
        <div class="col-sm-6">
          <h1>{{ .Name }}</h1>  
        </div>
        <div class="col-sm-6">
            <p>{{.ContactInfo.Email}} | {{.ContactInfo.PhoneNumber}}</p>
            <p>{{.ContactInfo.GithubUrl}} | {{.ContactInfo.Website}}</p>
        </div>
    </div>
    <hr/>
    <div class="row">
        <div class="col">
            <h2>Objective</h1>
            <p>{{ .Objective }}</p>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-7">
            <h2>Key Achievements</h2>{{range .KeyAchievements}}
            <p>{{ . }}</p>{{end}}
        </div>
        <div class="col-sm-5">
            <h2>Skills</h2>
            <h3>Languages</h3>
            <ul>{{range .Skills.Languages}}
                <li>{{ . }}</li>{{end}}
            </ul>
            {{range .Skills.Additional }}
            <p>{{ . }}</p>{{end}}
        </div>
    </div>
    <div class="row">
        <div class="col">
            <h2>Education</h2>{{range .Education}}
            <p>{{.SchoolName}} ({{.Start}} - {{.End}}) - {{.Degree}}</p>{{end}}
        </div>
    </div>
    <div class="row">
        <div class="col">
            <h2>Professional Experience</h2>
            {{range .ProfessionalExperience}}
            <h3>{{.Employer}} ({{.Start}} - {{.End}})</h3>
            {{ if .Truncated}}<h4>Selected Highlights</h4>{{end}}
            {{range .Positions}}
            <h4>{{.Title}} ({{.Start}} - {{.End}})</h4>
            <ul>{{range .Summary}}
            <li>{{.}}</li>{{end}}
            </ul>
            {{if .Technologies}}
            <p><b>Technologies: {{range $i, $v := .Technologies}}{{if $i}}, {{end}}{{$v}}{{end}}</b></p>
            {{end}}
            {{end}}
            {{end}}
        </div>
    </div>
</div>

</html>
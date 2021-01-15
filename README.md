# Carbon Knight Backend

<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![Build Status](https://travis-ci.com/travis-ci/travis-web.svg?branch=master)](https://travis-ci.com/github/Carbon-Knight/carbon-knight-back-end)

  <h3 align="center">Carbon Knight Backend</h3>

  <p align="center">
    This is the Back End repository for the <a href="https://github.com/Carbon-Knight">Carbon Knight</a> application, which works in tandem with the <a href="https://github.com/Carbon-Knight/cloverly_microservice">Cloverly Microservice</a>. The Microservice connects with the <a href="https://www.cloverly.com/">Cloverly API</a> in order to return carbon footprint data, which the Back End then takes and compiles and feeds to the Front End.
    <br />
    <a href="https://github.com/Carbon-Knight/carbon-knight-back-end"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <!-- for adding a demo video
    <a href="Add our video link here">View Demo</a>  · -->
    ·
    <a href="https://github.com/Carbon-Knight/carbon-knight-back-end/issues">Report Bug</a>
    ·
    <a href="https://github.com/Carbon-Knight/carbon-knight-back-end/issues">Request Feature</a>
  </p>
</p>




<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Configuration](#configuration)
  * [Testing](#testing)
* [Contributing](#contributing)
* [Contact](#contact)
* [Acknowledgements](#acknowledgements)




<!-- ABOUT THE PROJECT -->
## About The Project
Please visit the [Carbon Knight Front End](https://github.com/Carbon-Knight/Front-End) repository and check out the readme there for a more in depth look at this project!

To view all the repositories associated with Carbon Knight, please visit [Carbon Knight](https://github.com/Carbon-Knight)


### Built With

* [Ruby](https://github.com/ruby/ruby)


<!-- GETTING STARTED -->
## Getting Started
To properly use this application you will need to set up and configure three repositories. Follow the *Configuration* directions in each repository to get Carbon Knight running locally! Alternatively, check out the production application [here](https://carbon-knight.herokuapp.com/)!!!


### Configuration
**Setting Up the Back-End**
1. Clone this repo `git clone https://github.com/Carbon-Knight/carbon-knight-back-end.git`

2. Enter the directory it was cloned into `cd carbon-knight-back-end`

3. Run `bundle install` to install gems and dependencies

4. Run `bundle exec rails db:{create,migrate}` to set up the database and to run the migrations

5. At this point, please visit [Configuration Part II](https://github.com/Carbon-Knight/Front-End#configuration) to get the full Carbon Knight Application up and running locally


### Testing

[RSpec](https://rspec.info/) was used for the testing of this project.

Carbon Knight Backend has been fully tested. To view the test coverage;

Once inside your terminal within the Carbon Knight Backend directory run the following command.

```
open coverage
```

This will open up a folder with an **index.html** file. Clicking on this file will show you a list of all the lines of code within this repository, and whether they have been tested or not.

Additionally, running ```bundle exec rspec``` will show you the quick summary of the test coverage in this application.

Both ```open coverage``` and ```bundle exec rspec``` work inside each repository of this application.

<!-- ROADMAP -->
## Roadmap

See [Open Issues](https://github.com/Carbon-Knight/carbon-knight-back-end/issues) or visit our [Project Board](https://github.com/orgs/Carbon-Knight/projects/1) for a list of proposed features, known issues, and project extensions.


<!-- CONTRIBUTING -->
## Contributing

Contributions are what make this community such an amazing and fun place to learn, grow, and create! Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch ```git checkout -b feature/NewGreatFeature```
3. Commit your Changes ```git commit -m 'Add some NewGreatFeature'```
4. Push to the Branch ```git push origin feature/NewGreatFeature```
5. Open a new Pull Request!


<!-- CONTACT -->
## Contact

Curtis Bartell &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/curtis-bartell/) - [GitHub](https://github.com/c-bartell)

Jonathan Wilson - [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/jonathan--wilson/) - [GitHub](https://github.com/Jonathan-M-Wilson)

Carson Jardine &nbsp;&nbsp; - [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/carson-jardine/) - [GitHub](https://github.com/carson-jardine)

Eugene Theriault - [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/eugene-theriault/) - [GitHub](https://github.com/ETBassist)

Roberto Basulto &nbsp;- [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/roberto-basulto/) - [GitHub](https://github.com/Eternal-Flame085)

James Belta &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/james-belta/) - [GitHub](https://github.com/JBelta)

Joshua Carey &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/carey-joshua/) - [GitHub](https://github.com/jdcarey128)

Kiera Allen &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/kieraallen/) - [GitHub](https://github.com/KieraAllen)

Sean Steel &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- [![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/sean-steel/) - [GitHub](https://github.com/s-steel)



Project Link: [Carbon Knight](https://github.com/Carbon-Knight)



<!-- ACKNOWLEDGEMENTS -->
<!-- Add resources that were used to help create this project here -->




<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/Carbon-Knight/carbon-knight-back-end
[contributors-url]: https://github.com/Carbon-Knight/carbon-knight-back-end/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Carbon-Knight/carbon-knight-back-end
[forks-url]: https://github.com/Carbon-Knight/carbon-knight-back-end/network/members
[stars-shield]: https://img.shields.io/github/stars/Carbon-Knight/carbon-knight-back-end
[stars-url]: https://github.com/Carbon-Knight/carbon-knight-back-end/stargazers
[issues-shield]: https://img.shields.io/github/issues/Carbon-Knight/carbon-knight-back-end
[issues-url]: https://github.com/Carbon-Knight/carbon-knight-back-end/issues
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555

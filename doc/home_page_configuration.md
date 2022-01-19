# Home Page configuration

You can configure the home page by editing the file `config/home_page.yml`

In this file you have an element per home page sections for example:

```yml
  how_it_works:
    display: true
  sustainable_goals:
    display: true
  highlights:
    display: true
  app_stores:
    display: false
```

## Sections Configuration

Set the `display` to true if you want to display this section and `false` if you want to hide the section.

Apart from that mandatory key to each section, some sections need extra configuration.

### Hero section configuration

In this section, we display randomly an slide, and these slides should be configured inside the `slides` key.

Each slide requires the options `author_name`, `author_picture`, `place` and `background_image`.

The `background_image` and the `author_picture` should be a the path inside the directory `app/assets/images`.

For example:

```yml
  hero:
    display: true
    slides:
      -
        author_name: Fiona A. I
        author_picture: placeholder/avatar.jpg
        place: Montseny
        background_image: home/home-hero-1.jpg
      -
        author_name: Fiona A. II
        author_picture: placeholder/avatar.jpg
        place: Montseny
        background_image: home/home-hero-2.jpg
      -
        author_name: Fiona A. III
        author_picture: placeholder/avatar.jpg
        place: Montseny
        background_image: home/home-hero-3.jpg
      -
        author_name: Fiona A. IV
        author_picture: placeholder/avatar.jpg
        place: Montseny
        background_image: home/home-hero-4.jpg
```

### Stats section configuration

The stats section should get the values from the database (Currently WIP), but we can display fake data by setting the `mock` key to `true` and setting the corresponding values.

For example:

```yml
  stats:
    display: true
    mock: true
    mock_people: 1_652
    mock_observations: 98_935
    mock_projects: 324
```

## Testimonials section configuration

In this section, we display different testimonial sliders, and these slides should be configured inside the `testimonials` key.

Each testimonial slide requires the keys `en`, `es`, `ca`, `author`, `author_picture`, and `place`.

The `author_picture` should be a path inside the directory `app/assets/images`.

```yml
  testimonials:
    display: true
    quotes:
      -
        en: "1 EN As a child I was constantly outside searching for bugs and other creatures. Unfortunately that need to explore faded away as I became older. Now that I’ve been hiking more often, Minka has helped bring back that side of myself. I don’t just look at a plant and see a plant. I get close enough to see what could be crawling on that plant, and I want to know everything about it."
        es: "1 ES As a child I was constantly outside searching for bugs and other creatures. Unfortunately that need to explore faded away as I became older. Now that I’ve been hiking more often, Minka has helped bring back that side of myself. I don’t just look at a plant and see a plant. I get close enough to see what could be crawling on that plant, and I want to know everything about it."
        ca: "1 CA As a child I was constantly outside searching for bugs and other creatures. Unfortunately that need to explore faded away as I became older. Now that I’ve been hiking more often, Minka has helped bring back that side of myself. I don’t just look at a plant and see a plant. I get close enough to see what could be crawling on that plant, and I want to know everything about it."
        author: Fiona I.
        place: Montseny
        author_picture: placeholder/avatar.jpg
      -
        en: "2 EN As a child I was constantly outside searching for bugs and other creatures. Unfortunately that need to explore faded away as I became older. Now that I’ve been hiking more often, Minka has helped bring back that side of myself. I don’t just look at a plant and see a plant. I get close enough to see what could be crawling on that plant, and I want to know everything about it."
        es: "2 ES As a child I was constantly outside searching for bugs and other creatures. Unfortunately that need to explore faded away as I became older. Now that I’ve been hiking more often, Minka has helped bring back that side of myself. I don’t just look at a plant and see a plant. I get close enough to see what could be crawling on that plant, and I want to know everything about it."
        ca: "2 CA As a child I was constantly outside searching for bugs and other creatures. Unfortunately that need to explore faded away as I became older. Now that I’ve been hiking more often, Minka has helped bring back that side of myself. I don’t just look at a plant and see a plant. I get close enough to see what could be crawling on that plant, and I want to know everything about it."
        author: Fiona II.
        place: Montseny
        auth
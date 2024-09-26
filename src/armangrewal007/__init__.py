from dataclasses import dataclass, field


@dataclass
class Contact:
    icon: str
    text: str
    link: str

@dataclass
class Experience:
    title: str
    company: str
    tech_stack: str
    duration: str
    details: list[str] = field(default_factory=list)

@dataclass
class Project:
    title: str
    url: str
    date: str
    tech_stack: str
    details: list[str] = field(default_factory=list)

@dataclass
class Skill:
    category: str
    skills: str

@dataclass
class Achievemnts:
    icon: str
    text: str
    link: str

@dataclass
class Activities:
    title: str
    description: str
    location: str

@dataclass
class Education:
    degree: str
    years: str
    institution: str
    cgpa: str
    link: str = None
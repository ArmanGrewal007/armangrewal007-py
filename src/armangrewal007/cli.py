from rich.console import Console
from rich.text import Text

def display_resume():
    console = Console()

    # Create styled text
    header = Text("Arman Singh Grewal's Resume", style="bold underline green")
    name = Text("Name: ", style="bold yellow") + Text("Arman Singh Grewal", style="blue")
    email = Text("Email: ", style="bold yellow") + Text("armancode4u@gmail.com", style="blue")
    linkedin = Text("LinkedIn: ", style="bold yellow") + Text("https://www.linkedin.com/in/armangrewal007", style="blue")
    github = Text("GitHub: ", style="bold yellow") + Text("https://github.com/armangrewal007", style="blue")

    # Header
    console.print()
    console.print(header, justify="center")
    console.print(name)
    console.print(email)
    console.print(linkedin)
    console.print(github)

    console.print("\n[bold underline]Education:[/]")
    console.print("- BSc in Machine Learning/AI")
    
    console.print("\n[bold underline]Projects:[/]")
    console.print("- Redis Optimization")
    console.print("- Neo4j Node Management")
    
    console.print("\n[bold underline]Work Experience:[/]")
    console.print("- Software Engineer Trainee (R&D) at Informatica")
    console.print("- Software Engineer Intern at Xperi (TiVo)")
    
    console.print("\n[bold underline]Skills:[/]")
    console.print("- Python, FastAPI, Django, Redis, Neo4j, Kafka, Linux")


def main():
    display_resume()

import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListarProvasComponent } from './listar-provas.component';

describe('ListarProvasComponent', () => {
  let component: ListarProvasComponent;
  let fixture: ComponentFixture<ListarProvasComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ListarProvasComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ListarProvasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

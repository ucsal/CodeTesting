import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DetalharProvaComponent } from './detalhar-prova.component';

describe('DetalharProvaComponent', () => {
  let component: DetalharProvaComponent;
  let fixture: ComponentFixture<DetalharProvaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DetalharProvaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DetalharProvaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

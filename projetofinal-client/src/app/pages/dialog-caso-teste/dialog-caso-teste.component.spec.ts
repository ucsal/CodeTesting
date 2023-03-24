import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DialogCasoTesteComponent } from './dialog-caso-teste.component';

describe('DialgogComponent', () => {
  let component: DialogCasoTesteComponent;
  let fixture: ComponentFixture<DialogCasoTesteComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DialogCasoTesteComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DialogCasoTesteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

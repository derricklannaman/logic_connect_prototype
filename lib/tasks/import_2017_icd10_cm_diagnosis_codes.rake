namespace :import do
  desc "Import Icd10 CM Diagnosis Codes"
  counter = 1
  task :Icd10_CM_2017_Diagnosis_Codes => [:environment] do
    puts "Start importing..."
    IO.foreach('icd10_cm_2017_diagnosis_codes.txt') do |line|
      code, *desc = line.split(" ")
      info = desc.join(" ")
      Icd10CmDiagnosisCode.create(code: code, code_system: "icd10", description: "ICD-10-CM Diagnosis Code", info: info)
      print "." * counter
    end
    puts "Boom. Finished Importing..."
  end
end

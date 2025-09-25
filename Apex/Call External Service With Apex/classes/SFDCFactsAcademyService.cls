public with sharing class SFDCFactsAcademyService {

    // Gets all courses by calling /courses api
    public void getAllCourses() {
        ExternalService.SFDCFactsAcademyCourses service = new ExternalService.SFDCFactsAcademyCourses();

        // Callout to getCourses() to get all courses
        ExternalService.SFDCFactsAcademyCourses.getCourses_Response courses = service.getCourses();

        // Iterates over the retrieved information
        // Code200 indicates a successful HTTP request
        if (courses.Code200.size() > 0) {
            for (ExternalService.SFDCFactsAcademyCourses_Course course : courses.Code200) {
                System.debug('Course Id: ' + course.id);
                System.debug('Course Title: ' + course.title);
                System.debug('Course Description: ' + course.description);
                System.debug('Course InstructorId: ' + course.instructorId);
                System.debug('Course Category: ' + course.category);
                System.debug('Course Duration: ' + course.duration);
            }
        }
    }

    // Get specific course by Id by calling /courses/{courseId} api
    public void getCourseById() {
        ExternalService.SFDCFactsAcademyCourses service = new ExternalService.SFDCFactsAcademyCourses();

        ExternalService.SFDCFactsAcademyCourses.getCoursesByCourseId_Request request = new ExternalService.SFDCFactsAcademyCourses.getCoursesByCourseId_Request();
        request.courseId = 'course1';

        // Callout to getCoursesByCourseId(), to get a specific course through its Id
        ExternalService.SFDCFactsAcademyCourses.getCoursesByCourseId_Response response = service.getCoursesByCourseId(request);
        // Code200 indicates a successful HTTP request
        ExternalService.SFDCFactsAcademyCourses_Course course = response.Code200;
        if (course != null) {
            System.debug('Course Id: ' + course.id);
            System.debug('Course Title: ' + course.title);
            System.debug('Course Description: ' + course.description);
            System.debug('Course InstructorId: ' + course.instructorId);
            System.debug('Course Category: ' + course.category);
            System.debug('Course Duration: ' + course.duration);
        }
    }

    // Get all courses by calling /courses api
    public void getAllInstructors() {
        ExternalService.SFDCFactsAcademyCourses service = new ExternalService.SFDCFactsAcademyCourses();

        // Callout to getInstructors(), to get a specific instructor's Id, Name, and Bio
        ExternalService.SFDCFactsAcademyCourses.getInstructors_Response instructors = service.getInstructors();

        // Iterates over the retrieved information
        // Code200 indicates a successful HTTP request
        if (instructors.Code200.size() > 0) {
            for (ExternalService.SFDCFactsAcademyCourses_Instructor instructor : instructors.Code200) {
                System.debug('Instructor Id: ' + instructor.id);
                System.debug('Instructor Name: ' + instructor.name);
                System.debug('Instructor Bio: ' + instructor.bio);
            }
        }
    }
}
